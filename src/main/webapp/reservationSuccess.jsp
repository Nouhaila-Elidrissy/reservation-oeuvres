<!DOCTYPE html>
<html>
<head>
    <title>Réservation Réussie</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <script>
        Swal.fire({
            title: "Réservation Réussie !",
            text: "Votre réservation a été effectuée avec succès.",
            icon: "success",
            confirmButtonText: "OK",
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "livres.jsp"; // Redirection après confirmation
            }
        });
    </script>
</body>
</html>
