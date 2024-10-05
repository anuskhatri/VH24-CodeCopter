import React from 'react';
import './App.css'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import OrderConfirmation from './orderConfirmation';

function App() {
  return (
    <Router>
      <Routes>
        {/* Example route where `orderId` is passed as a URL param */}
        <Route path="/orderToSupplier/:token" element={<OrderConfirmation />} />
      </Routes>
    </Router>
  );
}

export default App;
