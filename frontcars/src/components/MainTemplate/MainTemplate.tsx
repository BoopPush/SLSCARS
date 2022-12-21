import { Outlet } from "react-router-dom";
import { Footer } from "../Footer/Footer";
import { Header } from "../Header/Header";
import { ContainerSC, WrapperSC } from "./style";

export const MainTemplate = () => {
  return (
    <WrapperSC>
      <ContainerSC>
        <Header />
        <Outlet />
        <Footer />
      </ContainerSC>
    </WrapperSC>
  );
};
