// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SupplyChain{
    struct Product{
        uint productID;
        string serialNumber;
        uint price;
    }

    //If international delivery we do crypto payments before placing the order

    event payVendor(address sender, address companyAddress , uint amount);

    // When the order is placed
    event OrderPlaced(uint orderId, Product product, address recipient , uint amount, string deliveryLocation,
    string deliveryCountry);

    // When the product is at logistics
    event AtLogistics(uint orderId, Product product, uint timestamp,string logisticsName, string LogisticID);

    // The product is now in shipment
    event ReleasedByLogistics(uint orderId, Product product, uint timestamp, string shipmentId);

    // When our product is in Transit
    event InTransit(uint orderId, string currentLoc);

    // If International Delivery we emit an event when the product is in PK
    event ReachedInCountry(uint orderId,Product product, uint timestamp);
    
    //If its not we continue the normal path

    // The order is now picked by the courier
    event pickedByCourier(string courierName, uint timestamp, string deliveryLocation);
    //Product is delivered
    event productDelivered(uint timestamp , Product product);
    //If COD applicable
    event collectCOD(uint amount, uint timestamp);
    //Order closed
    event orderDone();

}