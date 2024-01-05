//default ημερομηνία εγγραφής η σημερινή 
document.getElementById('hmerominia_eggrafis').valueAsDate = new Date();


// Function to trigger the dynamic loading of sports based on coach code
function loadCoachSports() {
    var coachCode = document.getElementsByName("kwdikos_proponhth")[0].value;

    fetch("fortwsh_athlimatos_proponhth.php", {
        method: "POST",
        headers: {
            "Content-type": "application/x-www-form-urlencoded",
        },
        body: "kwdikos_proponhth=" + coachCode,
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById("athlimaTable").innerHTML = data;
    })
    .catch(error => console.error("Error:", error));
}

// Attach the function to the input field's input event
document.getElementsByName("kwdikos_proponhth")[0].addEventListener("input", loadCoachSports);

// Load sports on page load
window.onload = function () {
    loadCoachSports();
};