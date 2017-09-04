document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items
  const favListSubmit = document.querySelector(".favorite-submit");
  favListSubmit.addEventListener("click", (e) => {
    e.preventDefault();

    const favInputEl = document.querySelector(".favorite-input");
    const favInput = favInputEl.value;
    favInputEl.value = "";

    const placesList = document.getElementById("sf-places");
    const newPlaceLi = document.createElement("li");
    newPlaceLi.textContent = favInput;

    placesList.appendChild(newPlaceLi);
  });

  // adding new photos
  const photoShowButton = document.querySelector(".photo-show-button");
  photoShowButton.addEventListener("click", (e) => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.className = "photo-form-container";
    } else {
      photoForm.className = "photo-form-container hidden";
    }
  });

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", (e) => {
    e.preventDefault();

    const dogURLEl = document.querySelector(".photo-url-input");
    const dogURL = dogURLEl.value;
    dogURLEl.value = "";

    const newDogImg = document.createElement("img");
    newDogImg.src = dogURL;

    const newDogLi = document.createElement("li");
    newDogLi.appendChild(newDogImg);

    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newDogLi);
  });
});
