<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Button Redirect</title>
</head>
<body>

    <!-- Button that triggers the redirect -->
    <button id="redirectButton">Go to New Page</button>

    <script>
        // Wait for the DOM content to be fully loaded
        document.addEventListener('DOMContentLoaded', function() {
            // Get the button element
            const button = document.getElementById("redirectButton");

            // Add click event listener to the button
            button.addEventListener("click", function() {
                // Redirect to a new URL
                const targetUrl = "https://www.example.com";  // Replace with your target URL
                if (targetUrl) {
                    window.location.href = targetUrl;
                } else {
                    console.error("No URL specified for redirection.");
                }
            });
        });
    </script>

</body>
</html>
