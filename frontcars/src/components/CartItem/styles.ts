import { Link } from "react-router-dom";
import styled from "styled-components";

export const StyledBookItem = styled.div`
  display: flex;
  flex-direction: column;

  max-width: 252px;
  width: 100%;
  border: 1px solid #7d7d7d;

  cursor: pointer;
`;

export const StyledLink = styled(Link)`
  text-decoration: none;
  cursor: pointer;
`;
