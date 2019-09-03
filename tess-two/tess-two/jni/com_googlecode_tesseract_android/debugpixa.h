#ifndef TESSERACT_CCSTRUCT_DEBUGPIXA_H_
#define TESSERACT_CCSTRUCT_DEBUGPIXA_H_

// dummy DebugPixa for Android

#include "allheaders.h"

namespace tesseract {

// Class to hold a Pixa collection of debug images with captions and save them
// to a PDF file.
class DebugPixa {
 public:
  DebugPixa() {
  }
  // If the filename_ has been set and there are any debug images, they are
  // written to the set filename_.
  ~DebugPixa() {
  }

  // Adds the given pix to the set of pages in the PDF file, with the given
  // caption added to the top.
  void AddPix(const Pix* pix, const char* caption) {
  }

  // Sets the destination filename and enables images to be written to a PDF
  // on destruction.
  void WritePDF(const char* filename) {
  }
};

}  // namespace tesseract

#endif  // TESSERACT_CCSTRUCT_DEBUGPIXA_H_
