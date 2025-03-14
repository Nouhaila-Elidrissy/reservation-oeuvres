<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Stock épuisé</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <script>
        Swal.fire({
            title: "Stock épuisé !",
            text: "Désolé, ce livre n'est plus disponible en stock.",
            icon: "error",
            confirmButtonText: "Retour",
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "livres.jsp"; // Redirection après confirmation
            }
        });
    </script>
</body>
</html>
