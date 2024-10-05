import React, { useState } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

const OrderConfirmation = () => {
  const { token } = useParams(); // Extracting token from URL
  const [otp, setOtp] = useState('');
  const [errorMessage, setErrorMessage] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:3000/api/verifyOtp', { otp, token });
      console.log('OTP verification successful:', response.data);
      // You can navigate to another page or show a success message here
    } catch (error) {
      console.error('Error verifying OTP:', error);
      setErrorMessage('Invalid OTP. Please try again.');
    }
  };

  return (
    <div className="otp-container">
      <form onSubmit={handleSubmit} className="otp-form">
        <h2 className="otp-title">Enter OTP</h2>
        {errorMessage && <p className="error-message">{errorMessage}</p>}
        <input
          type="text"
          value={otp}
          onChange={(e) => setOtp(e.target.value)}
          placeholder="Enter OTP"
          className="otp-input"
          required
          maxLength="6"
        />
        <button type="submit" className="otp-button">Verify OTP</button>
      </form>
    </div>
  );
};

export default OrderConfirmation;
