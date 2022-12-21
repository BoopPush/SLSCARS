import React from "react";
import styled from "styled-components";
import { Colors } from "../../ui";

export const Calculator = () => {
  return (
    <ContainerSC>
      <TitleSC>КАЛЬКУЛЯТОР РАСХОДОВ</TitleSC>
    </ContainerSC>
  );
};

export const ContainerSC = styled.div`
  width: 786px;
  padding: 72px 53px;
  border-radius: 10px;

  background-color: ${Colors.PRIMARY};
`;

export const TitleSC = styled.p`
  font-weight: 400;
  font-size: 32px;
  line-height: 36px;

  color: ${Colors.INFOLIGHT};
`;
