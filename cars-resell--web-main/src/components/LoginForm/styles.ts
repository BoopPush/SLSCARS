import { Link } from "react-router-dom";
import styled from "styled-components";
import { Colors } from "../../ui";

export const StyledFormSC = styled.form`
  display: flex;
  flex-direction: column;
  row-gap: 40px;

  width: 100%;
  max-width: 600px;

  padding: 0 50px;

  border-radius: 16px;
  position: relative;
`;

export const ContainerFormSC = styled.section`
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  row-gap: 40px;
  width: 100%;
  height: 90vh;
  background-color: ${Colors.PRIMARY};
`;

export const TitleSC = styled.p`
  color: ${Colors.INFOLIGHT};
  font-weight: 400;
  font-size: 48px;
  line-height: 56px;
`;

export const LinkToSignIn = styled(Link)`
  color: ${Colors.INFOLIGHT};
  font-size: 16px;
  font-weight: 400;

  cursor: pointer;

  transition: all 0.5s ease-out;

  &:hover {
    color: ${Colors.SECONDARY};
    border-bottom: 1px solid ${Colors.SECONDARY};
  }
`;
