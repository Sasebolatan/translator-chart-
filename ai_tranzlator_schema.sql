-- SQL DDL: AI TRANZLATOR System

CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  selected_language VARCHAR(50)
);

CREATE TABLE Videos (
  video_id INT PRIMARY KEY,
  user_id INT,
  file_name VARCHAR(255),
  format VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Audio (
  audio_id INT PRIMARY KEY,
  video_id INT,
  audio_path VARCHAR(255),
  FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Transcripts (
  transcript_id INT PRIMARY KEY,
  audio_id INT,
  text TEXT,
  FOREIGN KEY (audio_id) REFERENCES Audio(audio_id)
);

CREATE TABLE Translations (
  translation_id INT PRIMARY KEY,
  transcript_id INT,
  language VARCHAR(50),
  translated_text TEXT,
  FOREIGN KEY (transcript_id) REFERENCES Transcripts(transcript_id)
);

CREATE TABLE Summaries (
  summary_id INT PRIMARY KEY,
  translation_id INT,
  summary_text TEXT,
  FOREIGN KEY (translation_id) REFERENCES Translations(translation_id)
);
