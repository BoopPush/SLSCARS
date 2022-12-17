import { Link } from "react-router-dom";
import styled from "styled-components";

export const StyledBookItem = styled.div`
  display: flex;
  flex-direction: column;

  padding: 0 16px;
  max-width: 352px;

  border-radius: 20px;

  cursor: pointer;
`;

export const StyledLink = styled(Link)`
  text-decoration: none;
`;
