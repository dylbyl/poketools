// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

let plugin = require('tailwindcss/plugin')

module.exports = {
	content: [
		'./js/**/*.js',
		'../lib/*_web.ex',
		'../lib/*_web/**/*.*ex'
	],
	theme: {
		extend: {
			fontFamily: {
				pixel: ['Press Start 2P'],
				sourcesans: ['Source Sans Pro']
			},
			keyframes: {
				wiggle: {
					'0%, 100%': {
						transform: 'rotate(1deg) scale(1.25)'
					},
					'10%': {
						transform: 'rotate(-45deg) translateY(-10px) translateX(-5px) scale(1.25)',
					},
					'25%': {
						transform: 'rotate(25deg) scale(1.25)'
					},
					'33%': {
						transform: 'rotate(-1deg) scale(1.25)'
					},
					'40%': {
						transform: 'rotate(-1deg) scale(1.25)'
					},
					'50%': {
						transform: 'rotate(45deg) translateY(-10px) translateX(5px) scale(1.25)'
					},
					'65%': {
						transform: 'rotate(-25deg) scale(1.25)'
					},
					'73%': {
						transform: 'rotate(-1deg) scale(1.25)'
					},
				}
			},
			animation: {
				wiggle: 'wiggle 2s ease-in-out infinite',
			}
		},
	},
	plugins: [
		require('@tailwindcss/forms'),
		plugin(({ addVariant }) => addVariant('phx-no-feedback', ['&.phx-no-feedback', '.phx-no-feedback &'])),
		plugin(({ addVariant }) => addVariant('phx-click-loading', ['&.phx-click-loading', '.phx-click-loading &'])),
		plugin(({ addVariant }) => addVariant('phx-submit-loading', ['&.phx-submit-loading', '.phx-submit-loading &'])),
		plugin(({ addVariant }) => addVariant('phx-change-loading', ['&.phx-change-loading', '.phx-change-loading &']))
	]
}
