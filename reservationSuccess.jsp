<!DOCTYPE html>
<html>
<head>
    <title>R�servation R�ussie</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <script>
        Swal.fire({
            title: "R�servation R�ussie !",
            text: "Votre r�servation a �t� effectu�e avec succ�s.",
            icon: "success",
            confirmButtonText: "OK",
            allowOutsideClick: false
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "livres.jsp"; // Redirection apr�s confirmation
            }
        });
    </script>
</body>
</html>
