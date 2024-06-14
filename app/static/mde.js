document.addEventListener('DOMContentLoaded', function () {
    const inputDescElement = document.querySelector('#book_full_description');

    if (inputDescElement) {
        const easyMarkdownEditor = new EasyMDE({
            element: inputDescElement,
        });
    }
});

document.addEventListener('DOMContentLoaded', function () {
    const inputDescElement = document.querySelector('#review-text');

    if (inputDescElement) {
        const easyMarkdownEditor = new EasyMDE({
            element: inputDescElement,
        });
    }
});
