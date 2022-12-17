import { Outlet } from "react-router-dom";
import { Header } from "../Header/Header";
import { ContainerSC, WrapperSC } from "./style";

export const MainTemplate = () => {
  return (
    <WrapperSC>
      <ContainerSC>
        <Header />
        <Outlet />
      </ContainerSC>
    </WrapperSC>
  );
};
