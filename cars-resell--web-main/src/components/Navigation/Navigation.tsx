import { routes } from "../../routes";
import { ContainerSC, LinkSC, LoginButtonSC } from "./style";

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
  return (
    <ContainerSC>
      {config.map((item, index) => (
        <LinkSC to={item.href} key={index}>
          {item.title}
        </LinkSC>
      ))}

      <LoginButtonSC to={routes.LOGIN}>Войти</LoginButtonSC>
    </ContainerSC>
  );
};
