import React from "react";
import styled from "styled-components";
import { Calculator } from "../components/Calculator/Calculator";

export const Calculate = () => {
  return (
    <WrapperSC>
      <Calculator />
    </WrapperSC>
  );
};

export const WrapperSC = styled.div`
  width: 100%;
  height: 60vh;
  display: flex;
  justify-content: center;
  align-items: center;
`;
