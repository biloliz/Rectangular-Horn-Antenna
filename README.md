# 📡 Rectangular Horn Antenna Radiation Pattern Simulation
This is a MATLAB project that visualizes the 3D radiation pattern of a Rectangular Horn Antenna! This simulation demonstrates how the aperture dimensions affect the far-field gain using normalized parameters and a custom sinc-based approach.

## 📜 Features
🧮 Mathematical Modeling of far-field gain using custom sinc(x) formulation

📊 3D Visualization of antenna gain pattern using surface plotting

📐 Aperture Control via adjustable width (a) and height (b)

🧱 Horn Structure Rendering included for physical reference

🎨 Turbo Colormap and lighting effects for better aesthetics

## 🧠 How It Works
Define Parameters

Normalized wavelength λ = 1

Aperture dimensions a and b

Create angular grid for spherical coordinates

Compute Far-Field Gain

Use sinc(kx) and sinc(ky) based on direction cosines

Multiply and normalize to get gain pattern

Visualize in 3D

Convert to Cartesian coordinates

Plot gain surface and horn model for better context

## 🧰 Requirements
MATLAB (any recent version supporting surf, patch, and meshgrid)

No toolboxes required 🎉

## 🖼 Sample Output
The output is a smooth, colorful 3D plot representing the radiation intensity in different directions. It also shows a simplified horn shape 🧊 for better visualization.

## 📎 Notes
The wavelength is normalized to 1 to simplify calculations

A custom sinc function is used to avoid division-by-zero errors

You can tweak a, b, and horn_length to experiment with different designs

