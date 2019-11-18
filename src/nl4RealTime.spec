# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['nl4RealTime.py'],
             pathex=['/media/kelly/Disque dur/Informatique/MASTER UPMC STL/PiSTL/PISTL/src'],
             binaries=[],
             datas=[],
             hiddenimports=['nltk'],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='nl4RealTime',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=True )
