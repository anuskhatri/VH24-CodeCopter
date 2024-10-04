const getProfile = require("../../actions/profile/fetchProfile");

const fetchProfile = async (req, res) => {
    try {
        const { userId } = req.params;
        const data = await getProfile(userId);
        
        // data.forEach((obj) => {
        //     obj.total_funded_amount = String(obj.total_funded_amount);
            
        //     obj.transaction_logs.forEach((log) => {
        //         log.amount = String(log.amount);
        //     });
        // });

        return res.status(200).send(data);
    } catch (error) {
        console.log("ERROR at fetchProfile ", error);
        return res.status(500).send("Internal Server Error");
    }
};

module.exports = fetchProfile;
