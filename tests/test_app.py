import pytest

from app import app


@pytest.fixture
def client():
    """Create a test client for the Flask app."""
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client


class TestApp:
    """Test cases for the Flask application."""

    def test_index_route_returns_200(self, client):
        """Test that the index route returns a 200 status code."""
        response = client.get("/")
        assert response.status_code == 200

    def test_index_route_returns_html(self, client):
        """Test that the index route returns HTML content."""
        response = client.get("/")
        assert response.content_type == "text/html; charset=utf-8"

    def test_index_contains_slider_element(self, client):
        """Test that the index page contains the slider element."""
        response = client.get("/")
        assert b"comparison-slider" in response.data

    def test_index_contains_images(self, client):
        """Test that the index page references both images."""
        response = client.get("/")
        assert b"park.png" in response.data
        assert b"matrix.png" in response.data

    def test_index_contains_slider_handle(self, client):
        """Test that the index page contains the slider handle."""
        response = client.get("/")
        assert b"sliderHandle" in response.data

    def test_index_loads_css(self, client):
        """Test that the index page loads CSS."""
        response = client.get("/")
        assert b"style.css" in response.data

    def test_index_loads_javascript(self, client):
        """Test that the index page loads JavaScript."""
        response = client.get("/")
        assert b"slider.js" in response.data

    def test_static_css_file_exists(self, client):
        """Test that the CSS file is accessible."""
        response = client.get("/static/css/style.css")
        assert response.status_code == 200

    def test_static_js_file_exists(self, client):
        """Test that the JavaScript file is accessible."""
        response = client.get("/static/js/slider.js")
        assert response.status_code == 200

    def test_invalid_route_returns_404(self, client):
        """Test that invalid routes return a 404 status code."""
        response = client.get("/nonexistent")
        assert response.status_code == 404
