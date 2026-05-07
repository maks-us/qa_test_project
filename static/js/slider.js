document.addEventListener('DOMContentLoaded', () => {
    const slider = document.getElementById('comparisonSlider');
    const handle = document.getElementById('sliderHandle');
    const firstImg = slider.querySelector('.first-img');
    const secondImg = slider.querySelector('.second-img');
    let isActive = false;

    function updateSliderPosition(e) {
        if (!isActive) return;

        const rect = slider.getBoundingClientRect();
        let x = e.clientX - rect.left;

        // Clamp x between 0 and slider width
        x = Math.max(0, Math.min(x, rect.width));

        // Calculate percentage
        const percentage = (x / rect.width) * 100;

        // Update handle position
        handle.style.left = percentage + '%';

        // Both images stay full width, clip-path controls visible portion
        secondImg.style.clipPath = `inset(0 ${100 - percentage}% 0 0)`;
        firstImg.style.clipPath = `inset(0 0 0 ${percentage}%)`;
    }

    function onMouseDown() {
        isActive = true;
    }

    function onMouseUp() {
        isActive = false;
    }

    // Mouse events
    slider.addEventListener('mousedown', onMouseDown);
    document.addEventListener('mousemove', updateSliderPosition);
    document.addEventListener('mouseup', onMouseUp);

    // Touch events for mobile
    slider.addEventListener('touchstart', () => {
        isActive = true;
    });

    document.addEventListener('touchmove', (e) => {
        if (!isActive) return;

        const touch = e.touches[0];
        const rect = slider.getBoundingClientRect();
        let x = touch.clientX - rect.left;

        x = Math.max(0, Math.min(x, rect.width));
        const percentage = (x / rect.width) * 100;

        handle.style.left = percentage + '%';
        secondImg.style.clipPath = `inset(0 ${100 - percentage}% 0 0)`;
        firstImg.style.clipPath = `inset(0 0 0 ${percentage}%)`;
    });

    document.addEventListener('touchend', () => {
        isActive = false;
    });

    // Initialize slider at 50%
    handle.style.left = '50%';
    secondImg.style.clipPath = 'inset(0 50% 0 0)';
    firstImg.style.clipPath = 'inset(0 0 0 50%)';
});
