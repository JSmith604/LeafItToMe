import React from "react";
import { useAuth0 } from "@auth0/auth0-react";
import { Button } from "react-bootstrap";
import styled from "styled-components";

const Styles = styled.div`
  Button {
    font-family: "Averia Libre", cursive !important;
  }
`;

export default function LoginButton() {
  // destructure the auth0 hook
  const { loginWithRedirect } = useAuth0();

  return(
    <Styles>
      <Button variant="success" onClick={() => loginWithRedirect()} >
        Log In
      </Button>
    </Styles>
  )
}