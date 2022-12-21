import { Link } from "react-router-dom";
import styled from "styled-components";
import { Colors } from "../../ui";

export const StyledHeaderSC = styled.header`
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

export const LOGOSC = styled(Link)`
  cursor: pointer;
  font-weight: 400;
  font-size: 44px;
  line-height: 50px;

  color: ${Colors.INFOLIGHT};
`;
