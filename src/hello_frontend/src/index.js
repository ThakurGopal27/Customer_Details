import { hello_backend } from "../../declarations/hello_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const firstname = document.getElementById("fname").value.toString();
  const lastname = document.getElementById("lname").value.toString();
  const email = document.getElementById("ename").value.toString();
  const phone = document.getElementById("pname").value.toString();
  const message = document.getElementById("wname").value.toString();

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  const greeting = await hello_backend.greet(firstname,lastname,email,phone,message);

  button.removeAttribute("disabled");

  document.getElementById("greeting").innerText = greeting;

  return false;
});
