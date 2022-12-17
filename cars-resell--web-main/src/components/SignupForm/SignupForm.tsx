import { Controller, useForm } from "react-hook-form";
import { useNavigate } from "react-router-dom";
import { routes } from "../../routes";
import { Button } from "../Button";
import { Input } from "../Input";

import { ContainerFormSC, LinkToSignIn, StyledFormSC, TitleSC } from "./styles";
import { IUserForm } from "./types";

export const SignupForm = () => {
  const navigate = useNavigate();

  const {
    register,
    handleSubmit,
    clearErrors,
    control,
    formState: { errors },
  } = useForm<IUserForm>();

  const onSubmit = (data: IUserForm) => {
    navigate(routes.HOME);
  };

  return (
    <ContainerFormSC>
      <TitleSC>Регистрация</TitleSC>
      <StyledFormSC onSubmit={handleSubmit(onSubmit)}>
        <Controller
          name="name"
          control={control}
          render={({ field: { onChange, value } }) => (
            <Input
              type="text"
              label="name"
              value={value}
              onChange={onChange}
              errors={errors.email?.message}
              register={register}
              placeholder=" Введите ваше имя"
            />
          )}
          rules={{
            required: false,
            onChange: () => {
              if (errors) {
                clearErrors("password");
                clearErrors("email");
              }
            },
          }}
        />
        <Controller
          name="surname"
          control={control}
          render={({ field: { onChange, value } }) => (
            <Input
              type="text"
              label="surname"
              value={value}
              onChange={onChange}
              errors={errors.email?.message}
              register={register}
              placeholder=" Введите вашу фамилию"
            />
          )}
          rules={{
            required: false,
            onChange: () => {
              if (errors) {
                clearErrors("password");
                clearErrors("email");
              }
            },
          }}
        />
        <Controller
          name="email"
          control={control}
          render={({ field: { onChange, value } }) => (
            <Input
              type="email"
              label="email"
              value={value}
              onChange={onChange}
              errors={errors.email?.message}
              register={register}
              placeholder=" Введите ваш email"
            />
          )}
          rules={{
            required: false,
            onChange: () => {
              if (errors) {
                clearErrors("password");
                clearErrors("email");
              }
            },
          }}
        />
        <Controller
          name="password"
          control={control}
          render={({ field: { onChange, value } }) => (
            <Input
              type="password"
              label="password"
              value={value}
              onChange={onChange}
              errors={errors.password?.message}
              register={register}
              placeholder=" Введите ваш пароль"
            />
          )}
          rules={{
            required: false,
            onChange: () => {
              if (!errors) {
                clearErrors("password");
                clearErrors("email");
              }
            },
          }}
        />
        <Button type="submit">Регистрация</Button>
      </StyledFormSC>
      <LinkToSignIn to={routes.LOGIN}>Вы уже зарегистрированы?</LinkToSignIn>
    </ContainerFormSC>
  );
};
