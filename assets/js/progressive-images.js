document.addEventListener('DOMContentLoaded', function() {
  // Process progressive images
  const processImage = (img) => {
    const highResSrc = img.dataset.src;
    if (!highResSrc) return;
    
    // Create new image to preload
    const highResImg = new Image();
    highResImg.src = highResSrc;
    
    highResImg.onload = function() {
      // Apply the high-res source
      img.src = highResSrc;
      img.classList.add('loaded');
      
      // Remove animation after load
      setTimeout(() => {
        img.style.animation = 'none';
      }, 1000);
    };
    
    highResImg.onerror = function() {
      console.error('Failed to load high-res image:', highResSrc);
    };
  };
  
  // Process all progressive images
  const progressiveImages = document.querySelectorAll('.progressive-image-low');
  progressiveImages.forEach(processImage);
});
