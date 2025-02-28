import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class InterestsSection extends StatelessWidget {
  final List<String> interests;
  final List<String> languages;

  const InterestsSection({
    Key? key,
    required this.interests,
    required this.languages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredInterests =
        interests.where((interest) => interest.isNotEmpty).toList();
    final filteredLanguages =
        languages.where((language) => language.isNotEmpty).toList();

    if (filteredInterests.isEmpty && filteredLanguages.isEmpty) {
      return SizedBox
          .shrink(); // Return an empty widget if no information is available
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (filteredInterests.isNotEmpty)
                  _buildChipSection(
                      context,
                      AppLocalizations.of(context)!.interests,
                      filteredInterests),
                if (filteredInterests.isNotEmpty &&
                    filteredLanguages.isNotEmpty)
                  const SizedBox(height: 16),
                if (filteredLanguages.isNotEmpty)
                  _buildChipSection(
                      context,
                      AppLocalizations.of(context)!.prefLanguage,
                      filteredLanguages),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChipSection(
      BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 20, color: AppTheme.black),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: items.map((item) => _buildChip(context, item)).toList(),
        ),
        const SizedBox(height: 5),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 0.91,
          color: AppTheme.lightGray,
        ),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Chip(
      label: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 14, color: AppTheme.black),
      ),
      backgroundColor: AppTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      side: BorderSide(color: Theme.of(context).primaryColor), // Added border
    );
  }
}
