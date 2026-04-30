# 🗳️ VaakDoot AI — India's Intelligent Election Education Platform

> **Virtual: PromptWars Hackathon | Challenge: Election Process Education**  
> **Author: Aman Kumar Gupta**  
> **Tech Stack: HTML5 · CSS3 · Vanilla JS · Google Gemini API · Google Maps API**

---

## 🏆 Project Overview

**VaakDoot AI** (वाकदूत — *Messenger of Democracy*) is a world-class, cinematic AI-powered web platform that helps Indian citizens understand the complete election process, know their voter rights, register to vote, and participate confidently in democracy.

Built as a **single-file SPA** with:
- 🎨 Cinematic 3D UI with particle physics, custom cursor, tilt cards
- 🤖 Google Gemini 2.0 Flash AI assistant (Hindi + English)
- 📍 Google Maps polling booth finder
- 🎯 3-level interactive quiz engine
- 📅 12-step animated election timeline
- ♿ Full WCAG 2.1 AA accessibility

---

## ✨ Features

### 🤖 AI Election Assistant (Google Gemini 2.0 Flash)
- Conversational AI in **Hindi and English**
- Voice input via Web Speech API (hi-IN / en-IN)
- Quick-prompt chips for common questions
- Context-aware multi-turn conversation
- Real-time typing indicator

### 📅 Interactive 3D Election Timeline
- **12-step visual journey** with scroll-triggered animations
- Bilingual (Hindi + English) descriptions
- Covers: Announcement → MCC → Nominations → Campaign → Voting → Counting → Government Formation

### 📖 Voter Registration Guide (4 Tabs)
- **Eligibility** — Who can vote
- **Documents** — What you need
- **Step-by-Step Process** — How to register
- **EPIC Card** — Visual mockup + download instructions

### 🎯 Election Knowledge Quiz
- **3 difficulty levels**: Easy, Medium, Hard (7+ questions each)
- 30-second timer with speed bonus scoring
- Instant explanations + wrong answer review
- Animated score ring

### 📍 Polling Booth Finder
- Google Maps JavaScript API integration
- Location search + "Use My Location" geolocation
- State-based constituency filter
- Direct ECI portal links

### 🌐 Multilingual
- Full Hindi ↔ English toggle
- Voice recognition in both languages

### 🎨 World-Class 3D UI/UX
- Custom animated cursor with magnetic effect
- Interactive particle canvas (WebGL-like)
- 3D card tilt on hover (mouse tracking)
- Cinematic page transitions
- Dark theme with tricolor accent system
- Scroll-triggered element reveals
- Floating holographic badge chips
- Animated Ashoka Wheel logo

---

## 🏗️ Architecture

```
vaakdoot-ai/
├── index.html    ← Complete single-file SPA (HTML + CSS + JS)
└── README.md
```

**Single-file design** ensures:
- Zero build tools required
- Instant deployment to any hosting
- Under 10MB (well under Antigravity/GitHub limit)
- Works offline after first load (except AI + Maps)

---

## 🔧 Setup

### Prerequisites
- Google Gemini API key → [aistudio.google.com](https://aistudio.google.com/app/apikey)
- Google Maps API key → [console.cloud.google.com](https://console.cloud.google.com/)

### Step 1 — Configure API Keys
Open `index.html` and replace:
```javascript
const GK = 'YOUR_GEMINI_API_KEY';
```
And in the Maps script tag:
```html
src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_KEY&callback=initMap"
```

### Step 2 — Run Locally
```bash
# Option A: Python server
python3 -m http.server 8000
# Visit http://localhost:8000

# Option B: Just open index.html in Chrome/Edge
```

### Step 3 — Deploy to GitHub Pages
```bash
git init
git add .
git commit -m "VaakDoot AI - PromptWars Submission"
git remote add origin https://github.com/YOUR_USERNAME/vaakdoot-ai.git
git push -u origin main
# Enable GitHub Pages: Settings → Pages → Branch: main
```

---

## 📊 Evaluation Criteria — How VaakDoot Delivers

| Criteria | Implementation |
|----------|---------------|
| **Code Quality** | Clean ES6+ JS, CSS custom properties, semantic HTML5, comprehensive comments |
| **Security** | API keys as placeholders, `rel="noopener"` on external links, no user-input innerHTML injection |
| **Efficiency** | Single-file SPA, GPU-accelerated CSS animations, lazy map init, no framework overhead |
| **Testing** | All 6 sections independently functional, quiz tested 3 difficulties, responsive 320px–4K |
| **Accessibility** | WCAG 2.1 AA: skip link, ARIA labels, live regions, keyboard navigation, focus indicators |
| **Google Services** | Gemini AI + Google Maps + Google Fonts + Web Speech API |

---

## 🌟 Google Services Used

| Service | Usage |
|---------|-------|
| **Google Gemini 2.0 Flash** | Core AI election Q&A assistant |
| **Google Maps JavaScript API** | Polling booth finder with geocoding |
| **Google Fonts API** | Cinzel + Outfit + Noto Sans Devanagari |
| **Web Speech API** | Voice input (hi-IN + en-IN) |

---

## 🎨 Design System

| Element | Choice |
|---------|--------|
| **Primary** | Saffron #FF6B00 (India's national color) |
| **Accent** | Green #00FF88 · Blue #00D4FF · Gold #FFD700 |
| **Background** | Deep navy #020408 (cinematic dark) |
| **Display Font** | Cinzel (Roman, authoritative) |
| **Body Font** | Outfit (modern, readable) |
| **Hindi Font** | Noto Sans Devanagari |
| **Cursor** | Custom saffron dot + ring |
| **Effects** | Particle canvas, 3D card tilt, floating badges, glow shadows |

---

## 📜 Chosen Vertical

**Election Process Education** — India has 900M+ eligible voters, yet millions (especially first-time and rural voters) lack clear information about how elections work. VaakDoot AI solves this with:

1. **Always-available AI tutor** (Gemini) that responds in the user's own language
2. **Visual animated timeline** breaking down the 12-step election process
3. **Practical registration guide** with actual document requirements
4. **Interactive quiz** to reinforce learning at 3 difficulty levels
5. **Map-based booth finder** to physically locate polling stations

---

## 🙏 Acknowledgments

- **Election Commission of India** (eci.gov.in) for official documentation
- **Google AI** for the Gemini API
- **PromptWars / Hack2Skill** for this hackathon
- Every Indian voter 🇮🇳

---

*"The ballot is stronger than the bullet." — Abraham Lincoln*

**VaakDoot AI** — Empowering Every Indian Voter 🗳️
