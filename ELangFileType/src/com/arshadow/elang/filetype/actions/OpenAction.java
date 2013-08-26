/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arshadow.elang.filetype.actions;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionRegistration;
import org.openide.cookies.EditorCookie;
import org.openide.filesystems.FileChooserBuilder;
import org.openide.filesystems.FileObject;
import org.openide.filesystems.FileUtil;
import org.openide.loaders.DataObject;
import org.openide.loaders.DataObjectNotFoundException;
import org.openide.util.NbBundle.Messages;

@ActionID(
        category = "File",
        id = "com.arshadow.elang.filetype.actions.OpenAction")
@ActionRegistration(
        displayName = "#CTL_OpenAction")
@ActionReference(path = "Menu/File", position = 1300)
@Messages("CTL_OpenAction=Open File")
public final class OpenAction implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {
     FileChooserBuilder fcb = new FileChooserBuilder(com.arshadow.elang.filetype.actions.OpenAction.class);
        fcb.setApproveText("Open");
        fcb.setFileFilter(new ELangFileFilter());

        JFileChooser jfc = fcb.createFileChooser();

        if (jfc.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
            try {
                File file = jfc.getSelectedFile();
                FileObject foSelectedFile = FileUtil.toFileObject(file);

                DataObject obj = DataObject.find(foSelectedFile);
                EditorCookie ec = obj.getLookup().lookup(EditorCookie.class);

                if (ec != null) {
                    ec.open();
                }

            } catch (DataObjectNotFoundException donfe) {
            }
        }
    }

    private final class ELangFileFilter extends FileFilter{

        @Override
        public boolean accept(File pathname) {

            if (pathname.isDirectory()){
                return true;
            }

            String[] path  = pathname.getPath().split("\\.");
            if (path[path.length - 1].equalsIgnoreCase("e")){
                return true;
            }

            return false;
        }

        @Override
        public String getDescription() {
            return "E files";
        }

    }
}
