/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import EditorHistoryPlugin
import Lexical
import LexicalInlineImagePlugin
import LexicalLinkPlugin
import LexicalListPlugin
import UIKit

class ViewController: UIViewController, UIToolbarDelegate {

  var lexicalView: LexicalView?
  weak var toolbar: UIToolbar?
  weak var hierarchyView: UIView?
  private let editorStatePersistenceKey = "editorState"

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    let editorHistoryPlugin = EditorHistoryPlugin()
    let toolbarPlugin = ToolbarPlugin(viewControllerForPresentation: self, historyPlugin: editorHistoryPlugin)
    let toolbar = toolbarPlugin.toolbar
    toolbar.delegate = self

    let hierarchyPlugin = NodeHierarchyViewPlugin()
    let hierarchyView = hierarchyPlugin.hierarchyView

    let listPlugin = ListPlugin()
    let imagePlugin = InlineImagePlugin()

    let linkPlugin = LinkPlugin()

    let theme = Theme()
    theme.indentSize = 40.0
    theme.link = [
      .foregroundColor: UIColor.systemBlue,
    ]
    theme.quote = [.ligature: 0,]

    let editorConfig = EditorConfig(theme: theme, plugins: [toolbarPlugin, listPlugin, hierarchyPlugin, imagePlugin, linkPlugin, editorHistoryPlugin])
    let lexicalView = LexicalView(editorConfig: editorConfig, featureFlags: FeatureFlags())
    let jsonString = """
{
    "root": {
      "children": [
        {
          "children": [
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": "Welcome to the playground",
              "type": "text",
              "version": 1
            }
          ],
          "direction": "ltr",
          "format": "",
          "indent": 0,
          "type": "heading",
          "version": 1,
          "tag": "h1"
        },
        {
          "children": [
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "color: #f5a623;",
              "text": "In case you were wondering what the black box at the bottom is – it's the debug view, showing the current state of the editor. You can disable it by pressing on the settings control in the bottom-left of your screen and toggling the debug view setting.",
              "type": "text",
              "version": 1
            }
          ],
          "direction": "ltr",
          "format": "",
          "indent": 0,
          "type": "quote",
          "version": 1
        },
        {
          "children": [
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": "The playground is a demo environment built with Try typing in ",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 1,
              "mode": "normal",
              "style": "",
              "text": "some text",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": " with ",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 2,
              "mode": "normal",
              "style": "",
              "text": "different",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": " formats.",
              "type": "text",
              "version": 1
            }
          ],
          "direction": "ltr",
          "format": "",
          "indent": 0,
          "type": "paragraph",
          "version": 1,
          "textFormat": 0
        },
        {
          "children": [
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": "Make sure to check out the various plugins in the toolbar. You can also use",
              "type": "text",
              "version": 1
            }
          ],
          "direction": "ltr",
          "format": "",
          "indent": 0,
          "type": "paragraph",
          "version": 1,
          "textFormat": 0
        },
        {
          "children": [
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": "If you'd like to ",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 2,
              "mode": "normal",
              "style": "",
              "text": "find",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": " out ",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 8,
              "mode": "normal",
              "style": "",
              "text": "more",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": " about ",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 8,
              "mode": "normal",
              "style": "",
              "text": "Lexical",
              "type": "text",
              "version": 1
            },
            {
              "detail": 0,
              "format": 0,
              "mode": "normal",
              "style": "",
              "text": ", you can:",
              "type": "text",
              "version": 1
            }
          ],
          "direction": "ltr",
          "format": "",
          "indent": 0,
          "type": "paragraph",
          "version": 1,
          "textFormat": 0
        },
        {
          "children": [
            {
              "children": [
                {
                  "detail": 0,
                  "format": 0,
                  "mode": "normal",
                  "style": "",
                  "text": "Visit the Lexical website for documentation and more information.",
                  "type": "text",
                  "version": 1
                }
              ],
              "direction": "ltr",
              "format": "",
              "indent": 0,
              "type": "listitem",
              "version": 1,
              "value": 1
            },
            {
              "children": [
                {
                  "detail": 0,
                  "format": 0,
                  "mode": "normal",
                  "style": "",
                  "text": "Check out the code on our GitHub repository.",
                  "type": "text",
                  "version": 1
                }
              ],
              "direction": "ltr",
              "format": "",
              "indent": 0,
              "type": "listitem",
              "version": 1,
              "value": 2
            },
            {
              "children": [
                {
                  "detail": 0,
                  "format": 0,
                  "mode": "normal",
                  "style": "",
                  "text": "Playground code can be found here.",
                  "type": "text",
                  "version": 1
                }
              ],
              "direction": "ltr",
              "format": "",
              "indent": 0,
              "type": "listitem",
              "version": 1,
              "value": 3
            },
            {
              "children": [
                {
                  "children": [
                    {
                      "children": [
                        {
                          "detail": 0,
                          "format": 0,
                          "mode": "normal",
                          "style": "",
                          "text": "二级列表",
                          "type": "text",
                          "version": 1
                        }
                      ],
                      "direction": "ltr",
                      "format": "",
                      "indent": 1,
                      "type": "listitem",
                      "version": 1,
                      "value": 1
                    },
                    {
                      "children": [
                        {
                          "detail": 0,
                          "format": 0,
                          "mode": "normal",
                          "style": "",
                          "text": "Join our Discord Server and chat with the team.",
                          "type": "text",
                          "version": 1
                        },
                        {
                          "detail": 2,
                          "format": 0,
                          "mode": "normal",
                          "style": "",
                          "text": "\t",
                          "type": "tab",
                          "version": 1
                        }
                      ],
                      "direction": "ltr",
                      "format": "",
                      "indent": 1,
                      "type": "listitem",
                      "version": 1,
                      "value": 2
                    },
                    {
                      "children": [
                        {
                          "children": [
                            {
                              "children": [
                                {
                                  "detail": 0,
                                  "format": 0,
                                  "mode": "normal",
                                  "style": "",
                                  "text": "最多支持三级列表功能",
                                  "type": "text",
                                  "version": 1
                                }
                              ],
                              "direction": "ltr",
                              "format": "",
                              "indent": 2,
                              "type": "listitem",
                              "version": 1,
                              "value": 1
                            },
                            {
                              "children": [
                                {
                                  "detail": 0,
                                  "format": 0,
                                  "mode": "normal",
                                  "style": "",
                                  "text": "aaaa",
                                  "type": "text",
                                  "version": 1
                                }
                              ],
                              "direction": "ltr",
                              "format": "",
                              "indent": 2,
                              "type": "listitem",
                              "version": 1,
                              "value": 2
                            }
                          ],
                          "direction": "ltr",
                          "format": "",
                          "indent": 0,
                          "type": "list",
                          "version": 1,
                          "listType": "bullet",
                          "start": 1,
                          "tag": "ul"
                        }
                      ],
                      "direction": "ltr",
                      "format": "",
                      "indent": 1,
                      "type": "listitem",
                      "version": 1,
                      "value": 3
                    }
                  ],
                  "direction": "ltr",
                  "format": "",
                  "indent": 0,
                  "type": "list",
                  "version": 1,
                  "listType": "bullet",
                  "start": 1,
                  "tag": "ul"
                }
              ],
              "direction": "ltr",
              "format": "",
              "indent": 0,
              "type": "listitem",
              "version": 1,
              "value": 4
            }
          ],
          "direction": "ltr",
          "format": "",
          "indent": 0,
          "type": "list",
          "version": 1,
          "listType": "bullet",
          "start": 1,
          "tag": "ul"
        },
        
      ],
      "direction": "ltr",
      "format": "",
      "indent": 0,
      "type": "root",
      "version": 1
    }
  }
"""
      do {
          let state = try EditorState.fromJSON(json: jsonString, editor: lexicalView.editor)
          print(state)
          try lexicalView.editor.setEditorState(state)
      }catch {
          
      }
      

    linkPlugin.lexicalView = lexicalView

    self.lexicalView = lexicalView
    self.toolbar = toolbar
      hierarchyView.backgroundColor = .red
    self.hierarchyView = hierarchyView

    self.restoreEditorState()

    view.addSubview(lexicalView)
    view.addSubview(toolbar)
    view.addSubview(hierarchyView)

    navigationItem.title = "Lexical"
    setUpExportMenu()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    if let lexicalView, let toolbar, let hierarchyView {
      let safeAreaInsets = self.view.safeAreaInsets
      let hierarchyViewHeight = 0.0

      toolbar.frame = CGRect(x: 0,
                             y: safeAreaInsets.top,
                             width: view.bounds.width,
                             height: 44)
      lexicalView.frame = CGRect(x: 0,
                                 y: toolbar.frame.maxY,
                                 width: view.bounds.width,
                                 height: view.bounds.height - toolbar.frame.maxY - safeAreaInsets.bottom - hierarchyViewHeight)
      hierarchyView.frame = CGRect(x: 0,
                                   y: lexicalView.frame.maxY,
                                   width: view.bounds.width,
                                   height: hierarchyViewHeight)
    }
  }

  func persistEditorState() {
    guard let editor = lexicalView?.editor else {
      return
    }

    let currentEditorState = editor.getEditorState()

    // turn the editor state into stringified JSON
    guard let jsonString = try? currentEditorState.toJSON() else {
      return
    }

    UserDefaults.standard.set(jsonString, forKey: editorStatePersistenceKey)
  }

  func restoreEditorState() {
    guard let editor = lexicalView?.editor else {
      return
    }

    guard let jsonString = UserDefaults.standard.value(forKey: editorStatePersistenceKey) as? String else {
      return
    }

    // turn the JSON back into a new editor state
    guard let newEditorState = try? EditorState.fromJSON(json: jsonString, editor: editor) else {
      return
    }

    // install the new editor state into editor
    try? editor.setEditorState(newEditorState)
  }

  func setUpExportMenu() {
    let menuItems = OutputFormat.allCases.map { outputFormat in
      UIAction(title: "Export \(outputFormat.title)", handler: { [weak self] action in
        self?.showExportScreen(outputFormat)
      })
    }
    let menu = UIMenu(title: "Export as…", children: menuItems)
    let barButtonItem = UIBarButtonItem(title: "Export", style: .plain, target: nil, action: nil)
    barButtonItem.menu = menu
    navigationItem.rightBarButtonItem = barButtonItem
  }

  func showExportScreen(_ type: OutputFormat) {
    guard let editor = lexicalView?.editor else { return }
    let vc = ExportOutputViewController(editor: editor, format: type)
    navigationController?.pushViewController(vc, animated: true)
  }

  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .top
  }
}
