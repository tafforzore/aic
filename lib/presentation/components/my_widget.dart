import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget buildCard(
    BuildContext context, {
      required String name,
      required String position,
      required String description,
      required String timeAgo,
      required String imageUrl,
    }) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar (avec image par défaut si vide)
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl) // Utiliser l'URL de l'image
                  : AssetImage("assets/images/default_logo.png") as ImageProvider, // Image par défaut
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16), // Espacement entre l'avatar et le texte
        // Texte
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nom et Temps
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nom
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp, // Utilisation de sizer pour plus de réactivité
                    ),
                    overflow: TextOverflow.ellipsis, // Evite que le texte dépasse
                  ),
                  // Temps
                  Text(
                    timeAgo,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // Poste
              Text(
                position,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis, // Evite le débordement de texte
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                description,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black87,
                ),
                maxLines: 2, // Limiter à 2 lignes
                overflow: TextOverflow.ellipsis, // Ajouter un ellipsis si trop long
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

