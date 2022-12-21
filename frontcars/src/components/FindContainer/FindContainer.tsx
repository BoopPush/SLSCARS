import { Box, Button } from "@mui/material";
import Modal from "@mui/material/Modal";
import { useState } from "react";
import styled from "styled-components";
import { Colors } from "../../ui";
import { FindForm } from "../FindForm/FindForm";
import { ModalBlock } from "../ModalBlock/ModalBlock";

const style = {
  position: "absolute" as "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 400,
  bgcolor: `${Colors.INFOLIGHT}`,
  boxShadow: 24,
  p: 4,
};

export const FindContainer = () => {
  const [open, setOpen] = useState(false);

  const handleClose = () => setOpen(false);

  const handleSubmit = () => {
    setOpen(true);
  };
  return (
    <>
      <Container>
        <Button variant="contained" size="medium" onClick={handleSubmit}>
          Калькулятор расходов
        </Button>
        <FindForm />
      </Container>
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <ModalBlock />
        </Box>
      </Modal>
    </>
  );
};

export const Container = styled.div`
  padding: 20px 0;
  margin: 0 auto;
  width: 400px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  row-gap: 20px;
`;
