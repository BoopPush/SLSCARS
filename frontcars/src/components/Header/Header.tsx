import { routes } from "../../routes";
import { Navigation } from "../Navigation";
import { ContainerSC, LOGOSC, StyledHeaderSC, WrapperSC } from "./style";

export const Header = () => {
  return (
    <StyledHeaderSC>
      <WrapperSC>
        <ContainerSC>
          <LOGOSC to={routes.HOME}>SLSCARS</LOGOSC>
          <Navigation />
        </ContainerSC>
      </WrapperSC>
    </StyledHeaderSC>
  );
};
