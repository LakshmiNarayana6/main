<form> 
<label for="name">Name:</label> 
<input type="text" id="name" name="name" required> 
<label for="dob">Date of Birth:</label> 
<input type="date" id="dob" name="dob" required> 
<div id="age-range"> 
<label for="age">Age:</label> 
<input type="range" id="age" name="age" min="18" max="100"> 
</div> 
<div id="email-group"> 
<label for="email">Email:</label> 
<input type="email" id="email" name="email" required> 
</div> 
<div id="website-group"> 
<label for="website">Website:</label> 
<input type="url" id="website" name="website"> 
</div> 
<button type="submit">Sign Up</button> 
</form> 
<script> 
// conditional logic to show or hide fields based on user input 
const ageRange = document.getElementById("age-range"); 
const emailGroup = document.getElementById("email-group"); 
const websiteGroup = document.getElementById("website-group"); 
ageRange.style.display = "none"; 
emailGroup.style.display = "none"; 
websiteGroup.style.display = "none"; 
document.getElementById("dob").addEventListener("change", function() { 
const age = calculateAge(this.value); 
if (age < 18) { 
ageRange.style.display = "none"; 
emailGroup.style.display = "none"; 
websiteGroup.style.display = "none"; 
} else if (age >= 18 && age <= 25) { 
ageRange.style.display = "block"; 
emailGroup.style.display = "block"; 
websiteGroup.style.display = "none"; 
} else { 
ageRange.style.display = "block"; 
emailGroup.style.display = "block"; 
websiteGroup.style.display = "block"; 
} 
}); 
// inline validation 
document.querySelectorAll("input[required]").forEach(input => { 
input.addEventListener("invalid", function() { 
this.setCustomValidity("Please fill out this field."); 
}); 
input.addEventListener("input", function() { 
this.setCustomValidity(""); 
}); 
}); 
// helper function to calculate age from date of birth 
function calculateAge(birthday) { 
const today = new Date(); 
const birthDate = new Date(birthday); 
let age = today.getFullYear() - birthDate.getFullYear(); 
const monthDiff = today.getMonth() - birthDate.getMonth(); 
if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) { 
age--; 
} 
return age; 
} 
</script> 
