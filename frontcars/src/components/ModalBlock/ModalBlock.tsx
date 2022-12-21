import { Box, TextField, Typography } from "@mui/material";
import React, { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { CustomAutocomplete } from "../CustomAutocomplete";
import { Button } from "../Button/Button";
import styles from "./ModalBlock.module.css";

export const ModalBlock = () => {
	const [type, setType] = useState<string | null>();
	const [deliveryToPostPrice, setdeliveryPrice] = useState<number>(0);
	const [visibility, setVisibility] = useState<boolean>(false);
	const [goThrouthBorderPrice, setgoThrouthBorderPrice] = useState<number>(0);

	const {
		handleSubmit,
		watch,
		control,
		getValues,
		clearErrors,
		formState: { isDirty, errors },
	} = useForm();

	const typeOptions = ["Бензиновый", "Дизельный", "Гибридный", "Электро"];
	const auctionOptions = ["Copart", "IAAI"];
	const ageOptions = ["до 2 лет", "от 2 до 5 лет", "от 5 лет"];

	const engineValue = watch("type");
	let priceValue = watch("price");
	const ageValue = watch("age");
	const capacityValue = watch("capacity");

	const onSubmit = () => {};

	function handleSubmitButtonClick() {
		setdeliveryPrice(Math.ceil(Math.random() * 1000) + 500);
		setVisibility(true);
		console.log(priceValue);
		switch (engineValue) {
			case "Электро":
				priceValue *= 1;
				break;
			default:
				var value = priceValue * 0.05;
				priceValue += value;
				break;
		}
		console.log(priceValue);
		switch (ageValue) {
			case "до 2 лет":
				var value = priceValue * 0.1;
				priceValue += value;
				break;
			case "от 2 до 5 лет":
				var value = priceValue * 0.15;
				priceValue += value;
				break;
			case "от 5 лет":
				var value = priceValue * 0.2;
				priceValue += value;
				break;
		}
		console.log(priceValue);
		switch (capacityValue) {
			case capacityValue <= 2000:
				var value = priceValue * 0.05;
				priceValue += value;
				break;
			case capacityValue <= 3500:
				var value = priceValue * 0.1;
				priceValue += value;
				break;

			default:
				var value = priceValue * 0.15;
				priceValue += value;
				break;
		}
		setgoThrouthBorderPrice(priceValue);
		return undefined;
	}

	return (
		<div>
			<form>
				<Typography sx={{ marginBottom: "20px" }}>
					КАЛЬКУЛЯТОР РАСХОДОВ
				</Typography>
				<Box sx={{ marginBottom: "20px", width: "300px" }}>
					<Controller
						name="type"
						control={control}
						render={({
							field: { onChange, value, onBlur },
							fieldState: { error },
						}) => (
							<CustomAutocomplete
								onChange={(event, value) => onChange(value)}
								onBlur={onBlur}
								options={typeOptions}
								value={value}
								placeholder="Двигатель"
								error={error}
							/>
						)}
					/>
				</Box>
				<Box sx={{ marginBottom: "20px", width: "300px" }}>
					<Controller
						name="price"
						control={control}
						render={({
							field: { onChange, value },
							fieldState: { error },
						}) => (
							<TextField
								sx={{ width: "300px" }}
								label="Стоимость Авто $"
								variant="outlined"
								size="small"
								value={value}
								type="number"
								onChange={onChange}
							/>
						)}
					/>
				</Box>
				<Box
					sx={{
						marginBottom: "20px",
						width: "300px",
					}}
				>
					<Controller
						name="age"
						control={control}
						render={({
							field: { onChange, value, onBlur },
							fieldState: { error },
						}) => (
							<CustomAutocomplete
								onChange={(event, value) => onChange(value)}
								onBlur={onBlur}
								options={ageOptions}
								value={value}
								placeholder="Возраст Авто"
								error={error}
							/>
						)}
					/>
				</Box>
				<Box sx={{ marginBottom: "20px", width: "300px" }}>
					<Controller
						name="capacity"
						control={control}
						render={({
							field: { onChange, value },
							fieldState: { error },
						}) => (
							<TextField
								sx={{ width: "300px" }}
								label="Объем двигателя"
								variant="outlined"
								size="small"
								value={value}
								type="number"
								onChange={onChange}
							/>
						)}
					/>
				</Box>
				<Box
					sx={{
						marginBottom: "20px",
						width: "300px",
					}}
				>
					<Controller
						name="auction"
						control={control}
						render={({
							field: { onChange, value, onBlur },
							fieldState: { error },
						}) => (
							<CustomAutocomplete
								onChange={(event, value) => onChange(value)}
								onBlur={onBlur}
								options={auctionOptions}
								value={value}
								placeholder="Выбор аукциона"
								error={error}
							/>
						)}
					/>
				</Box>
				<button
					className={styles.buttonCount}
					type="button"
					onClick={handleSubmitButtonClick}
				>
					Расчитать
				</button>
				<Box>
					<Controller
						name="auction"
						control={control}
						render={({
							field: { onChange, value, onBlur },
							fieldState: { error },
						}) => (
							<>
								<p
									className={
										!visibility ? styles.invisible : ""
									}
								>
									Доставка от Клайпеды до Минска: 780$
								</p>
								<p
									className={
										!visibility ? styles.invisible : ""
									}
								>
									Доставка от аукциона до порта в США:{" "}
									{deliveryToPostPrice}$
								</p>
								<p
									className={
										!visibility ? styles.invisible : ""
									}
								>
									Стоимость авто с учётом растаможки: {goThrouthBorderPrice}$
								</p>
							</>
						)}
					/>
				</Box>
			</form>
		</div>
	);
};
