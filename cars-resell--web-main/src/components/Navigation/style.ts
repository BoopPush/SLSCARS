import { Link } from "react-router-dom";
import styled from "styled-components";
import { Colors } from "../../ui";

export const ContainerSC = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;

  column-gap: 40px;
`;

export const LinkSC = styled(Link)`
  font-weight: 400;
  font-size: 20px;
  line-height: 32px;
  color: ${Colors.INFOLIGHT};
  cursor: pointer;

  transition: border 0.5s ease-out;

  &:hover {
    border-bottom: 1px solid ${Colors.INFOLIGHT};
  }
`;

export const LoginButtonSC = styled(Link)`
  background: transparent;
  border: 2px solid ${Colors.INFOLIGHT};
  color: ${Colors.INFOLIGHT};
  border-radius: 24px;
  font-weight: 700;
  font-size: 20px;
  line-height: 28px;
  border-radius: 56px;
  padding: 8px 40px;

  transition: background-color 0.5s ease-out, border-color 0.5s ease-out;

  &:hover {
    background-color: ${Colors.LIGHTBLUE};
    border-color: transparent;
  }
`;
