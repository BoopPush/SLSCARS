import React from "react";
import styled from "styled-components";
import { Colors } from "../../ui";

interface IProps {
  isOpen: boolean;
}

export const ItemsNavigation = ({ isOpen }: IProps) => {
  return (
    <WrapperSC isOpen={isOpen}>
      <EmailSC>email</EmailSC>
      <TextSC>Мои Подписки</TextSC>
      <LogOut>Выйти</LogOut>
    </WrapperSC>
  );
};

interface IProps {
  isOpen: boolean;
}

export const WrapperSC = styled.div<IProps>`
  width: 200px;
  height: 150px;

  display: none;
  flex-direction: column;

  align-items: flex-end;
  justify-content: space-between;
  padding: 20px 30px;
  position: absolute;
  top: 80px;
  right: 0;

  display: ${({ isOpen }) => (isOpen ? "flex" : "none")};

  background-color: ${Colors.PROGRESSDARK};
`;
export const EmailSC = styled.p`
  font-weight: 500;
  font-size: 18px;
  line-height: 22px;
  margin-bottom: 5px;
`;

export const TextSC = styled.p`
  font-weight: 400;
  font-size: 18px;
  line-height: 22px;
  margin-bottom: 5px;

  color: ${Colors.GRAY};
`;

export const LogOut = styled.button`
  border: 1px solid black;

  width: 100px;
  padding: 5px 0;
  cursor: pointer;

  &:hover {
    border: 1px solid ${Colors.PRIMARY};
  }
`;
