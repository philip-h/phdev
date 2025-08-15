main();

function main() {
  // Set color scheme on page load
  toggleMobileGoToTopButton();
}


/** Toggle dark mode using the browser's default dark mode.
  * Saves user's choice in local storage.
  */ 
function toggleDarkMode() {
  let $darkModeButton = document.getElementById("dark-mode");
  let root = document.documentElement;
  console.log("New one");

  // Get current color scheme.
  const currentColorPreference = getColorPreference(); 
  console.log(currentColorPreference);

  if (currentColorPreference == "dark") {
    const light = "light";
    root.removeAttribute("data-theme");
    window.localStorage.setItem("theme", light)
    $darkModeButton.textContent = "go dark";
  } else {
    const dark = "dark";
    root.setAttribute("data-theme", "dark")
    window.localStorage.setItem("theme", dark)
    $darkModeButton.textContent = "go light";
  }
}

/** Get user's prefered color scheme
  * @returns {string} "dark" or "light"
  */
function getColorPreference() {
  // First try local storage. If it's empty, the site defaults to light
  let currentColorPreference = window.localStorage.getItem("theme");
  if (currentColorPreference === null) {
    currentColorPreference = document.documentElement.getAttribute("data-theme")
      ? "dark"
      : "light";
  }

  if (currentColorPreference !== "light" && currentColorPreference !== "dark") {
    return "light";
  }
  return currentColorPreference;
}

/** Toggle the visibility of a "go to top" button
  *
  * If a user is on a small enough screen, and has scrolled
  * down past the nav bar, it shows a button that allows the
  * user to scroll to the top
  */ 
function toggleMobileGoToTopButton() {
  const goTopBtn = document.getElementById("go-top");
  const nav = document.getElementsByTagName("nav")[0];

  window.addEventListener("scroll", () => {
    const navVisible = nav.getBoundingClientRect().bottom > 0;
    const scrolledDown = window.scrollY > 50; // only after scrolling down a bit

    if (!navVisible && scrolledDown) {
      goTopBtn.classList.add("show");
    } else {
      goTopBtn.classList.remove("show");
    }
  });
}
