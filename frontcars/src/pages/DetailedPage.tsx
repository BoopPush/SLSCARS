import React, { useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { DetailsCar } from "../components/DetailesCar/DetailsCar";
import { useAppDispatch, useAppSelector } from "../store/hooks";
import { getCars } from "../store/selectors/carsSelectors";
import { fetchDetails } from "../store/slices/carsSlice";

export const DetailedPage = () => {
  const { id = "" } = useParams();
  const { result } = useAppSelector((state)=> state.cars);
  const dispatch = useAppDispatch();

  useEffect(() => {
    dispatch(fetchDetails(id));
  }, [id, dispatch]);

  const navigate = useNavigate();
  const handleBack = () => {
    navigate(-1);
  };
  return (
    <div>
      <button type="button" onClick={handleBack}>
        Back
      </button>
      <DetailsCar car={result?.lots[0]} />
    </div>
  );
};
