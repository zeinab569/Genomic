# theblast

A new Flutter project.
Implementation of BLAST(Basic Local Alignment Search Tool) algorithm in Dart.
This code can provide you with a glimpse of how BLAST works and how it can actually be realised in code.
This BLAST search is based on nucleotide-nucleotide search. Amino acid search  we may be provided on this repository.
Sorry for lack of comments in the source code. This change will also be done soon.

## BLAST implementation

In bioinformatics, BLAST is an algorithm and program for comparing primary biological sequence information, such as the amino-acid sequences of proteins or the nucleotides of DNA and/or RNA sequences. A BLAST search enables a researcher to compare a subject protein or nucleotide sequence with a library or database of sequences, and identify database sequences that resemble the query sequence above a certain threshold. For example, following the discovery of a previously unknown gene in the mouse, a scientist will typically perform a BLAST search of the human genome to see if humans carry a similar gene; BLAST will identify sequences in the human genome that resemble the mouse gene based on similarity of sequence.

## Blast algoritm
• Sequence (query) is broken into words of length W
• Align all words with sequences in the database
• Calculate score T for each word that aligns with a sequence in the
database using a substitution matrix
• Discard words whose T value is below a neighborhood score
threshold
• Extend words in both directions until score falls by dropoff value X
when compared to previous best score 


## BLAST implementation

In bioinformatics, BLAST is an algorithm and program for comparing primary biological sequence information, such as the amino-acid sequences of proteins or the nucleotides of DNA and/or RNA sequences. A BLAST search enables a researcher to compare a subject protein or nucleotide sequence with a library or database of sequences, and identify database sequences that resemble the query sequence above a certain threshold. For example, following the discovery of a previously unknown gene in the mouse, a scientist will typically perform a BLAST search of the human genome to see if humans carry a similar gene; BLAST will identify sequences in the human genome that resemble the mouse gene based on similarity of sequence.

## Blast algoritm
• Sequence (query) is broken into words of length W
• Align all words with sequences in the database
• Calculate score T for each word that aligns with a sequence in the
database using a substitution matrix
• Discard words whose T value is below a neighborhood score
threshold
• Extend words in both directions until score falls by dropoff value X
when compared to previous best score 


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
