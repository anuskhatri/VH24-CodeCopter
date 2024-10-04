const { pool } = require('../../config/dbConfig');

const fetchUserProfile = async (userId) => {
  try {
    // Fetch user details first
    const userQuery = `
      SELECT 
        users.name, 
        users.role, 
        users.contact_info
      FROM users
      WHERE users.id = $1;
    `;
    
    const userResult = await pool.query(userQuery, [userId]);
    const user = userResult.rows[0];

    if (!user) {
      throw new Error(`User with ID ${userId} not found`);
    }

    let donationQuery;
    let donationValues;
    
    // Based on the user's role, fetch relevant donation data and sum of donations
    if (user.role === 'NGO') {
      donationQuery = `
        SELECT 
          donations.id,
          donations.request_id,  -- Added request_id here
          donations.donation_amount, 
          donations.donation_date, 
          donations.funder_id,
          SUM(donations.donation_amount) OVER () AS sum_of_fund
        FROM donations
        WHERE donations.receiver_id = $1;
      `;
      donationValues = [userId];
    } else if (user.role === 'Funder') {
      donationQuery = `
        SELECT 
          donations.id,
          donations.request_id,  -- Added request_id here
          donations.donation_amount, 
          donations.donation_date, 
          donations.receiver_id,
          SUM(donations.donation_amount) OVER () AS sum_of_fund
        FROM donations
        WHERE donations.funder_id = $1;
      `;
      donationValues = [userId];
    } else {
      throw new Error("Invalid user role. Role should be either 'NGO' or 'Funder'");
    }
    
    // Fetch the donation rows
    const donationResult = await pool.query(donationQuery, donationValues);
    const donationRows = donationResult.rows;
    const sumOfFund = donationRows.length > 0 ? donationRows[0].sum_of_fund : 0; // Get sum from the first row or default to 0

    // Return user profile and donation rows
    return {
      name: user.name,
      role: user.role,
      contact_info: user.contact_info,
      sum_of_fund: sumOfFund,
      donations: donationRows.map(({ id, request_id, donation_amount, donation_date, funder_id, receiver_id }) => ({
        id,
        request_id,  // Added request_id in the returned object
        donation_amount,
        donation_date,
        funder_id,
        receiver_id
      }))
    };
  } catch (error) {
    console.error('Error fetching user profile:', error);
    throw new Error('Failed to fetch user profile: ' + error.message);
  }
};

module.exports = fetchUserProfile;
