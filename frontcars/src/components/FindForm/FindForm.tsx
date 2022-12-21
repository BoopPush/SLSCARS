import styled from "styled-components";
import { Box, Button } from "@mui/material";
import { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { carsApi } from "../../services/CarsService";
import { useAppDispatch } from "../../store/hooks";
import { unsetList } from "../../store/slices/carsSlice";

import { CustomAutocomplete } from "../CustomAutocomplete";

export const FindForm = () => {
  const dispatch = useAppDispatch();
  const { handleSubmit, control, setValue } = useForm();

  const marks = [
    "Acura",
    "Audi",
    "BMW",
    "Chevrolet",
    "Ford",
    "Honda",
    "Mazda",
    "Mercedes-Benz",
    "Toyota",
  ];
  const [models, setModels] = useState([]);
  const [cars, setCars] = useState([]);
  const [mark, setMark] = useState<string | null>();
  const [model, setModel] = useState<string | null>();

  const getModels = async (option: string) => {
    setModels(await carsApi.getBrandAndModel(option!));
  };
  const getMarks = async (option: any, model: any) => {
    setCars(await carsApi.getCarByBrabdAndModel(option, model));
  };
  const handleAll = (option: string | null, name:any) => {
    setValue(name, option);
    dispatch(unsetList());
    setMark(option);
    getModels(option!);
  };
  const onSubmit = (data: any) => {
    console.log(data)
    dispatch(unsetList());
    getMarks(mark, model);
  };

  console.log(marks);

  return (
    <div>
      <form onSubmit={handleSubmit(onSubmit)}>
        <Box className="w-[408px]">
          <Controller
            name="marks"
            control={control}
            render={({
              field: { onChange, value, onBlur, name },
              fieldState: { error },
            }) => (
              <CustomAutocomplete
                placeholder="Марка"
                value={value}
                onChange={(event, value) => onChange(handleAll(value, name))}
                onBlur={onBlur}
                options={marks}
                error={error}
              />
            )}
          />

          <Controller
            name="models"
            control={control}
            render={({
              field: { onChange, value, onBlur },
              fieldState: { error },
            }) => (
              <CustomAutocomplete
                placeholder="Модель"
                value={value}
                onChange={(event, value) => onChange(setModel(value))}
                onBlur={onBlur}
                options={models}
                error={error}
              />
            )}
          />

          <Button variant="contained" className="normal-case" type="submit">
            НАЙТИ
          </Button>
        </Box>
      </form>
    </div>
  );
};

