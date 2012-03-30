/*
* Copyright 2004 The Apache Software Foundation
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package validators;

import java.io.InputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.tagext.PageData;
import javax.servlet.jsp.tagext.TagLibraryValidator;
import javax.servlet.jsp.tagext.ValidationMessage;


/**
 * Example tag library validator that simply dumps the XML version of each
 * page to standard output (which will typically be sent to the file
 * <code>$CATALINA_HOME/logs/catalina.out</code>).  To utilize it, simply
 * include a <code>taglib</code> directive for this tag library at the top
 * of your JSP page.
 *
 * @author Craig McClanahan
 * @version $Revision$ $Date$
 */

public class DebugValidator extends TagLibraryValidator {


    // ----------------------------------------------------- Instance Variables


    // --------------------------------------------------------- Public Methods


    /**
     * Validate a JSP page.  This will get invoked once per directive in the
     * JSP page.  This method will return <code>null</code> if the page is
     * valid; otherwise the method should return an array of
     * <code>ValidationMessage</code> objects.  An array of length zero is
     * also interpreted as no errors.
     *
     * @param prefix The value of the prefix argument in this directive
     * @param uri The value of the URI argument in this directive
     * @param page The page data for this page
     */
    @Override
    public ValidationMessage[] validate(String prefix, String uri, PageData page) {

        System.out.println("---------- Prefix=" + prefix + " URI=" + uri +
                           "----------");

        InputStream is = page.getInputStream();
        while (true) {
            try {
                int ch = is.read();
                if (ch < 0)
                    break;
                System.out.print((char) ch);
            } catch (IOException e) {
                break;
            } finally {
                closeInputStream(is);
            }
        }
        System.out.println();
        System.out.println("-----------------------------------------------");
        return (null);

    }

    private void closeInputStream(InputStream is) {
        try {
            is.close();
        } catch (IOException ex) {
            Logger.getLogger(DebugValidator.class.getName()).log(Level.SEVERE, "Problem occurs during I/O operation", ex);
        }
    }
}
