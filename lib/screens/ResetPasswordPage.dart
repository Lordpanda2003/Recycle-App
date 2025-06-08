import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 24),
              Text(
                "Créer un nouveau mot de passe",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF28B446),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Votre nouveau mot de passe doit être différent des précédents.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              _champMotDePasse("Nouveau mot de passe"),
              SizedBox(height: 16),
              _champMotDePasse("Confirmer le mot de passe"),
              SizedBox(height: 24),
              ElevatedButton(
                              onPressed: () => Navigator.pushNamed(context, '/login'),
              style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF28B446),
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),  // keep full width, fixed height
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // smaller radius = more square-like corners
    ),
  ),
                child: Text("Réinitialiser le mot de passe"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _champMotDePasse(String label) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
