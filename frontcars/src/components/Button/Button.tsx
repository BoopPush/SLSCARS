import React from "react";
import { ButtonSC } from "./style";
import { IButton } from "./types";

export const Button = ({
  children,
  type,
  handleClick,
}: React.PropsWithChildren<IButton>) => {
  return (
    <ButtonSC type={type} onClick={handleClick}>
      {children}
    </ButtonSC>
  );
};
