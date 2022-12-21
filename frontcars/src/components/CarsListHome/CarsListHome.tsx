import { useEffect } from "react";
import { useAppDispatch, useAppSelector } from "../../store/hooks";
import { getCars } from "../../store/selectors/carsSelectors";
import { fetchCars } from "../../store/slices/carsSlice";
import { CartItem } from "../CartItem/CartItem";
import { ContainerSC, StyledBookList } from "./style";

export const CarsListHome = () => {
  const cars = useAppSelector(getCars);
  const dispatch = useAppDispatch();

  useEffect(() => {
    dispatch(fetchCars());
  }, [dispatch]);

  return (
    <ContainerSC>
      <StyledBookList>
        {cars.lots?.map((car: any) => (
          <CartItem key={car.vin} car={car} />
        ))}
      </StyledBookList>
    </ContainerSC>
  );
};
