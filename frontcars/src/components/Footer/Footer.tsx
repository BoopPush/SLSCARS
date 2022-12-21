import React from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";
import { routes } from "../../routes";
import { Colors } from "../../ui";

export const Footer = () => {
  return (
    <StyledHeaderSC>
      <WrapperSC>
        <ContainerSC>
          <BlockSC>
            <TexTSC to={routes.HOME}>Главная</TexTSC>
            <TexTSC to="#">Telegram для связи: @nashtg</TexTSC>
          </BlockSC>
          <BlockSC>
            <TexTSC to="#">О Сайте/Контакты</TexTSC>
            <TexTSC to="#">Наш E-mail: nashemail@mail.ru</TexTSC>
          </BlockSC>
        </ContainerSC>
      </WrapperSC>
    </StyledHeaderSC>
  );
};

export const StyledHeaderSC = styled.footer`
  width: 100%;
  /* z-index: 2;

  position: fixed; */
  background-attachment: fixed;
  background-position: top center;
  background-color: ${Colors.PRIMARY};
`;

export const WrapperSC = styled.div`
  width: 100%;
  max-width: 1400px;

  margin: 0 auto;
  padding: 36px 100px 26px;
`;

export const ContainerSC = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

export const BlockSC = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: space-between;
`;

export const TexTSC = styled(Link)`
  font-weight: 400;
  font-size: 24px;
  line-height: 43px;

  color: #ffffff;
`;
