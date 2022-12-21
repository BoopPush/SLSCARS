import { routes } from "../../routes";
import { useAppSelector } from "../../store/hooks";
import { getUserInfo } from "../../store/selectors/userSelectors";
import { ContainerSC, LinkSC, LoginButtonSC } from "./style";
import { ReactComponent as Account } from "../../assets/account.svg";
import { useState } from "react";
import { ItemsNavigation } from "./ItemsNavigation";

const config = [
  {
    href: `${routes.HOME}`,
    title: "Главная",
  },
  {
    href: "#",
    title: "О сайте/Контакты",
  },
  {
    href: `${routes.CALCULATE}`,
    title: "Калькулятор расходов",
  },
];

export const Navigation = () => {
  const { isAuthorized } = useAppSelector(getUserInfo);

  const [isOpen, setOpen] = useState(false);

  const handleClick = () => {
    setOpen(!isOpen);
  };

  return (
    <ContainerSC>
      {config.map((item, index) => (
        <LinkSC to={item.href} key={index}>
          {item.title}
        </LinkSC>
      ))}
      {isAuthorized ? (
        <>
          <button onClick={handleClick}>
            <Account />
          </button>

          <ItemsNavigation isOpen={isOpen} />
        </>
      ) : (
        <LoginButtonSC to={routes.LOGIN}>Войти</LoginButtonSC>
      )}
    </ContainerSC>
  );
};
