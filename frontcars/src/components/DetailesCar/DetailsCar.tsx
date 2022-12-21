import React from "react";
import styled from "styled-components";
import { ICar } from "../../types";

export const DetailsCar = ({ car }: any) => {
  console.log(car);
  return (
    <CarInfo>
      <div>
        <h3>{car?.model}</h3>
        <InfoImage src={car?.imagesrc} alt="car" />
      </div>
      <CarInfoBlock>
        <InfoItem>Bid: {car?.bid}$</InfoItem>
        <InfoItem>Color: {car?.color}</InfoItem>
        <InfoItem>Condition: {car?.condition}</InfoItem>
        <InfoItem>Documents: {car?.docs}</InfoItem>
        <InfoItem>Drive: {car?.drive}</InfoItem>
        <InfoItem>Engine: {car?.engine}</InfoItem>
        <InfoItem>Location: {car?.location}</InfoItem>
        <InfoItem>Seller: {car?.seller}</InfoItem>
        <InfoItem>VIN: {car?.vin}</InfoItem>
        <InfoItem>Sale Date: {car?.saledate}</InfoItem>
        <InfoItem>Primary DAM: {car?.primarydam}</InfoItem>
        <InfoItem>Fuel: {car?.fuel}</InfoItem>
      </CarInfoBlock>
    </CarInfo>
  );
};

const CarInfo = styled.div`
  display:flex;
  justify-content:center;
  gap: 30px;
  margin-bottom: 50px;
`;

const CarInfoBlock = styled.div`
  margin-top: 20px;
`

const InfoItem = styled.div`
  border: 1px solid #aeaeae;

  &:nth-child(2n) {
    background-color: #dedede;
  }
`


const InfoImage = styled.img`
  height: 400px;
`