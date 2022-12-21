import { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { useNavigate } from "react-router-dom";
import styled from "styled-components";
import { routes } from "../../routes";
import UserService from "../../services/UserService";
import { useAppDispatch } from "../../store/hooks";
import { setUser } from "../../store/slices/userSlices";
import { Button } from "../Button";
import { Input } from "../Input";

import { ContainerFormSC, LinkToSignIn, StyledFormSC, TitleSC } from "./styles";
import { IUserForm } from "./types";

export const SignupForm = () => {
  const navigate = useNavigate();
  const dispatch = useAppDispatch();
  const [error, setError] = useState("");

  const {
    register,
    handleSubmit,
    clearErrors,
    control,
    formState: { errors },
  } = useForm<any>();

  const onSubmit = (data: IUserForm) => {
    UserService.registerUser(data)
      .then((data) => {
        if (data) {
          localStorage.setItem("user", JSON.stringify(data));

          dispatch(setUser(data));
          navigate(routes.HOME);
          return;
        }
        setError("Something went wrong");
      })
      .catch((e) => {
        setError("Something went wrong");
      });
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
              errors={errors.email?.message as any}
              register={register}
              placeholder=" Введите ваше имя"
            />
          )}
          rules={{
            required: true,
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
              errors={errors.email?.message as any}
              register={register}
              placeholder=" Введите вашу фамилию"
            />
          )}
          rules={{
            required: true,
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
              errors={errors.email?.message as any}
              register={register}
              placeholder=" Введите ваш email"
            />
          )}
          rules={{
            required: true,
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
              errors={errors.password?.message as any}
              register={register}
              placeholder=" Введите ваш пароль"
            />
          )}
          rules={{
            required: true,
            onChange: () => {
              if (!errors) {
                clearErrors("password");
                clearErrors("email");
              }
            },
          }}
        />
        {error && <ErrorContainer>{error}</ErrorContainer>}
        <Button type="submit">Регистрация</Button>
      </StyledFormSC>
      <LinkToSignIn to={routes.LOGIN}>Вы уже зарегистрированы?</LinkToSignIn>
    </ContainerFormSC>
  );
};

const ErrorContainer = styled.div`
  color: red;
`;
