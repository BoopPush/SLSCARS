import React from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";
import { ICar } from "../../types";
import { StyledBookItem, StyledLink } from "./styles";
interface ICarProps {
  car: ICar;
}

export const CartItem = ({ car }: ICarProps) => {
  return (
    <StyledBookItem>
      <Link to={`/cars/${car.vin}`}>
        <img src={car.imagesrc} alt="car image" />
        <NameSC>
          {car.model} {car.year} {car.color}:{car.vin}
        </NameSC>
        <BlockSC>
          <Info>
            <TitleSC>Auction:</TitleSC>
            <InfoSC>{car.auction}</InfoSC>
          </Info>
          <Info>
            <TitleSC>Lot number:</TitleSC>
            <InfoSC>{car.primarydam}</InfoSC>
          </Info>
          <Info>
            <TitleSC>Condition:</TitleSC>
            <InfoSC>{car.condition}</InfoSC>
          </Info>
          <Info>
            <TitleSC>Mileage:</TitleSC>
            <InfoSC>{car.mileage}</InfoSC>
          </Info>
          <Info>
            <TitleSC>Date of sale:</TitleSC>
            <InfoSC>{car.saledate}</InfoSC>
          </Info>
        </BlockSC>
      </Link>
    </StyledBookItem>
  );
};

export const ImageSC = styled.img`
  width: 100%;
  margin-bottom: 5px;
`;

export const NameSC = styled.p`
  font-size: 15px;
  line-height: 18px;
  margin-bottom: 5px;
  font-weight: 600;
  margin-left: 4px;
`;

export const Info = styled.div`
  display: flex;
  column-gap: 10px;
  width: 100%;
  margin-bottom: 5px;

  border-bottom: 1px solid #7d7d7d;

  &:last-child {
    margin-bottom: 0;
    border-bottom: 0;
  }
`;
export const TitleSC = styled.p`
  font-size: 15px;
  color: #7d7d7d;
`;
export const InfoSC = styled.p`
  font-size: 15px;
  color: black;
`;

export const BlockSC = styled.div`
  padding: 0 4px;
`;
