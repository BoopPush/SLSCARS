import styled from "styled-components";
import { Colors } from "../../ui";

export const ButtonSC = styled.button`
  background-color: ${Colors.PRIMARY};
  border: 2px solid ${Colors.INFOLIGHT};
  color: ${Colors.INFOLIGHT};

  font-weight: 700;
  font-size: 20px;
  line-height: 28px;

  border-radius: 56px;

  padding: 16px 56px;

  transition: background-color 0.5s ease-out, border-color 0.5s ease-out;

  &:hover {
    background-color: ${Colors.LIGHTBLUE};
    border-color: transparent;
  }
`;
